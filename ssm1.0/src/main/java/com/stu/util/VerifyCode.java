package com.stu.util;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * @ClassName VerifyCode
 * @Description 自动生成验证码的类
 * @Author Lee
 * @Date 2020/1/5 0005 21:35
 * @Version 1.0
 **/
public class VerifyCode {

    /**
     * 绘画验证码
     *
     * @param output
     * @return
     */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /**
     * 随机参数一个字符
     *
     * @return
     */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }

    /**
     * 登录逻辑
     */
//    @RequestMapping("/login")
//    public void login(HttpServletRequest request, HttpSession session) {
//        String inputVerifyCode=request.getParameter("verifyCode");
//        System.out.println("用户输入的验证码值------>"
//                + inputVerifyCode);
//        String verifyCodeValue=(String) session.getAttribute("verifyCodeValue");
//        System.out.println("Session中的验证码值------>"
//                + verifyCodeValue);
//        if(verifyCodeValue.equals(inputVerifyCode.toUpperCase())){
//            System.out.println("用户输入的验证码和图片生成的验证码相等，登陆成功");
//        }
//    }

}
