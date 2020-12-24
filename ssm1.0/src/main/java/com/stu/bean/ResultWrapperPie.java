package com.stu.bean;

import java.io.Serializable;

/**
 * @ClassName ResultWrapperPie
 * @Description 参数包装类
 * @Author Lee
 * @Date 2020/9/25 9:28
 * @Version 1.0
 **/
public class ResultWrapperPie implements Serializable {

    static final long serialVersionUID = 1L;

    private String cName;
    private double percent;

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public double getPercent() {
        return percent;
    }

    public void setPercent(double percent) {
        this.percent = percent;
    }
}
