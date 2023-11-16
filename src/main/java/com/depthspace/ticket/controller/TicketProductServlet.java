package com.depthspace.ticket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import com.depthspace.account.model.account.AccountVO;
import com.depthspace.attractions.model.CityVO;
import com.depthspace.restaurant.model.restaurant.RestVO;
import com.depthspace.ticket.model.TicketImagesVO;
import com.depthspace.ticket.model.TicketTypesVO;
import com.depthspace.ticket.model.TicketVO;
import com.depthspace.ticket.service.TicketImagesService;
import com.depthspace.ticket.service.TicketService;
import com.depthspace.ticket.service.TicketServiceImpl;
import com.depthspace.ticketcollection.model.TicketCollectionVO;
import com.depthspace.ticketcollection.service.TicketCollectionService;
import com.depthspace.ticketcollection.service.TicketCollectionServiceImpl;
import com.depthspace.ticketorders.model.ticketorderdetail.TicketOrderDetailVO;
import com.depthspace.ticketorders.model.ticketorders.TicketOrdersVO;

@WebServlet("/ticketproduct/*")
public class TicketProductServlet extends HttpServlet {

	private TicketService ticketService;
	private TicketImagesService ticketImagesService;
	private TicketCollectionService ticketCollectionService;

	@Override
	public void init() throws ServletException {
		ticketService = new TicketServiceImpl();
		ticketCollectionService = new TicketCollectionServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String pathInfo = req.getPathInfo();
		if (pathInfo == null) {
			pathInfo = "";
		}

		switch (pathInfo) {
		case "/": // 票券進入連結
			res.sendRedirect(req.getContextPath() + "/frontend/ticketproduct/info.jsp");
			break;
		case "/list": // 票券列表
				doList(req, res);
			break;
		case "/item": // 票券單一頁面
			doProduct(req, res);
			break;
		case "/search": // 票券查找
			doSearch(req, res);
			break;
		default:
			System.out.println("Path not handled: " + pathInfo);
		}
	}

	/************ 左側搜尋欄 **********/
	public void searchList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<TicketVO> ticketListAll = ticketService.getAllTickets();
		List<TicketVO> filteredList = ticketListAll.stream()
                .filter(ticketVO -> ticketVO.getStatus() != 0) 
                .collect(Collectors.toList());
		req.setAttribute("ticketListAll", filteredList);

		// 處理票券類型不重複
		Set<TicketTypesVO> uniqueTicketTypes = new HashSet<>();
		for (TicketVO ticket : filteredList) {
			uniqueTicketTypes.add(ticket.getTicketType());
		}
		req.setAttribute("uniqueTicketTypes", new ArrayList<>(uniqueTicketTypes));
		// 處理票券區域不重複
		Set<CityVO> uniqueTicketArea = new HashSet<>();
		for (TicketVO ticket : filteredList) {
			uniqueTicketArea.add(ticket.getCity());
		}
		req.setAttribute("uniqueTicketArea", new ArrayList<>(uniqueTicketArea));

	}
	
	/************ 右側列表評價 ************/
	private void reviewsList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// 取得所有票券內容(VO)
		List<TicketVO> ticketList = ticketService.getAllTickets();

		// 存放星星數跟評價數、訂單數
		Map<Integer, Double> averageStarsMap = new HashMap<>();
		Map<Integer, Integer> totalRatingCountMap = new HashMap<>();
//		Map<Integer, Integer> ticketOrderCountMap = new HashMap<>();

		//計算星星跟評價平均數
		for (TicketVO ticket : ticketList) {
		    Integer ticketId = ticket.getTicketId();
		    Integer totalStars = ticketService.getTotalStars(ticketId);
		    Integer totalRatingCount = ticketService.getTotalRatingCount(ticketId);
		    
		    double averageStars = totalRatingCount > 0 ? (double) totalStars / totalRatingCount : 0;
		    String formattedAverageStars = String.format("%.1f", averageStars);

		    averageStarsMap.put(ticketId, Double.parseDouble(formattedAverageStars));
		    totalRatingCountMap.put(ticketId, totalRatingCount);
	
		    //查詢訂單數
//		    List<TicketOrderDetailVO> ticketOrderDetails = ticketService.findTicketOrderDetailsByTicketId(ticketId);
//	        int orderCount = ticketOrderDetails.size();  // 訂單數為票券訂單明細列表的大小
//	        ticketOrderCountMap.put(ticketId, orderCount);  // 將票券ID和對應的訂單數存放到map中
	 
		}
		
		req.setAttribute("averageStarsMap", averageStarsMap);
		req.setAttribute("totalRatingCountMap", totalRatingCountMap);
//		req.setAttribute("ticketOrderCountMap", ticketOrderCountMap);
		
	}

	private void doList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   
	    String page = req.getParameter("page");
	    int currentPage = (page != null) ? Integer.parseInt(page) : 1;
	    String sortField = req.getParameter("sortField");
	    String sortOrder = req.getParameter("sortOrder");

	    // 預設排序
	    if (sortField == null || sortField.isEmpty()) {
	        sortField = "ticketId"; 
	    }
	    if (sortOrder == null || sortOrder.isEmpty()) {
	        sortOrder = "asc";
	    }
	    
	    Map<String, List<String>> filterMap = new HashMap<>();
	    Enumeration<String> paramNames = req.getParameterNames();
	    while (paramNames.hasMoreElements()) {
	        String paramName = paramNames.nextElement();
	        String[] paramValues = req.getParameterValues(paramName);
	        filterMap.put(paramName, Arrays.asList(paramValues));
	    }

	    // 調用 findTickets 方法
	    List<TicketVO> tickets = ticketService.findTickets(currentPage, sortField, sortOrder, filterMap);
	    reviewsList(req, res);
	    searchList(req, res);
	    req.setAttribute("resultSet", tickets);

	    RequestDispatcher dispatcher;
	    if ("true".equals(req.getParameter("ajax"))) {
	        dispatcher = req.getRequestDispatcher("/frontend/ticketproduct/listpart.jsp");
System.out.println("TTTTT："+ tickets);
	    } else {
	        dispatcher = req.getRequestDispatcher("/frontend/ticketproduct/list.jsp");
	    }
	    dispatcher.forward(req, res);
	}


	
	/************ 搜尋 ************/	
	private void doSearch(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    res.setContentType("application/json");
	    res.setCharacterEncoding("UTF-8");

	    // 創建查詢map
	    Map<String, String[]> parameterMap = req.getParameterMap();
	    // 調用萬用查詢方法
	    List<TicketVO> resultList = ticketService.getTicketsByCompositeQuery(parameterMap);
	    Set<TicketVO> resultSet = new HashSet<>(resultList);
		//下架篩選
		List<TicketVO> filteredList = resultSet.stream()
                 .filter(ticketVO -> ticketVO.getStatus() != 0) 
                 .collect(Collectors.toList());
	    
		req.setAttribute("paramValues", parameterMap);
		
	    // 查詢結果的票券數量
	    int searchCount = filteredList.size();
	    req.setAttribute("searchCount", searchCount);

	    // 查詢結果存入
	    req.setAttribute("searchSet", filteredList);
	    
//	    reviewsList(req, res);
//		searchList(req, res);

//	    req.getRequestDispatcher("/frontend/ticketproduct/search.jsp").forward(req, res);
	}

	
	
	/************ 單一票券頁面 ************/
	private void doProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
	    Integer memId = (Integer) session.getAttribute("memId");
	    
		String ticketIdStr = req.getParameter("ticketId");
		Integer ticketId;
		
		try {
			ticketId = Integer.valueOf(ticketIdStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return;
		}

		TicketVO ticket = ticketService.getTicketById(ticketId);
		if(ticket == null) {
			return;
		}
		
	    // 評價列表
	    List<TicketOrderDetailVO> reviews = ticketService.findTicketOrderDetailsByTicketId(ticketId);

	    // 星星平均數
	    double averageStars = reviews.stream()
                .filter(r -> r.getStars() != null)
                .mapToInt(TicketOrderDetailVO::getStars)
                .average()
                .orElse(0);
	    String formattedAverageStars = String.format("%.1f", averageStars);

	    // 評價單數
	    long totalRatingCount = reviews.stream()
	                                   .filter(r -> r.getStars() != null)
	                                   .count();

	    // 評價內容
	    List<String> reviewContents = reviews.stream()
	                                         .map(TicketOrderDetailVO::getTicketReviews)
	                                         .filter(Objects::nonNull)
	                                         .collect(Collectors.toList());


	    //判斷收藏與否
	    TicketCollectionVO ticketCollection = ticketCollectionService.getOne(memId, ticketId);
	    boolean isFavorite = ticketCollection != null;
		
	    req.setAttribute("ticket", ticket);
	    req.setAttribute("averageStars", averageStars);
	    req.setAttribute("formattedAverageStars", formattedAverageStars);
	    req.setAttribute("totalRatingCount", totalRatingCount);
	    req.setAttribute("reviews", reviews);
	    req.setAttribute("reviewContents", reviewContents);
		req.setAttribute("isFavorite", isFavorite);
	    
		req.getRequestDispatcher("/frontend/ticketproduct/item.jsp").forward(req, res);
	}
}
