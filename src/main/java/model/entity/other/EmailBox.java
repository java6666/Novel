package model.entity.other;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 邮箱表
* */
public class EmailBox {
    private Integer id;           //主键id
    private Integer addresseeId;  //发件人id
    private Integer recipientsId; //收件人id
    private String content;        //邮件内容
    private Date createDate;       //发件日期
}
