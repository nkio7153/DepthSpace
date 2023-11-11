package com.depthspace.utils;

import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
/**
 * Jwt 生成器 請勿亂動
 */
@Slf4j
@Component
public class AdminJwtUtil {
    private static final long EXPIRATION_TIME = TimeUnit.DAYS.toMillis(5);
    /**
     * JWT SECRET KEY
     */
    @Value("${Admin_Jwt_SECRET}")
    private String secret;


    /**
     * 簽發JWT
     */
    public String generateToken(Map<String, String> userDetails) {
        Map<String, Object> claims = new HashMap<>();
        claims.put( "adminId", userDetails.get("adminId") );
        return Jwts.builder()
                .setClaims( claims )
                .setExpiration( new Date( Instant.now().toEpochMilli() + EXPIRATION_TIME  ) )
                .signWith(SignatureAlgorithm.HS256, secret )
                .compact();//返回的 JwtBuilder 物件的一個方法。
    }
    /**
     * 驗證JWT
     */
    public Claims validateToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey( secret )
                    .parseClaimsJws( token )
                    .getBody();

        } catch (SignatureException e) {
            log.info("SignatureException");
        }
        catch (MalformedJwtException e) {
            log.info("MalformedJwtException");
        }
        catch (ExpiredJwtException e) {
            log.info("ExpiredJwtException");
        }
        catch (UnsupportedJwtException e) {
            log.info("UnsupportedJwtException");
        }
        catch (IllegalArgumentException e) {
            log.info("JWT token compact of handler are invalid");
        }
        return null;
    }

    public  String getUserName(String jwt){
        Claims claims = Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(jwt)
                .getBody();
        return  claims.get("adminId",String.class);
    }

    public String createJwt(String sub){
        return Jwts.builder()
                .setSubject(sub)
                .setExpiration( new Date( Instant.now().toEpochMilli() + EXPIRATION_TIME  ) )
                .signWith(SignatureAlgorithm.HS256, secret )
                .compact();
    }
}
