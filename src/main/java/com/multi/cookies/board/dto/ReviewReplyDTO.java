package com.multi.cookies.board.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewReplyDTO {
    private int reply_id;
    private int review_id;
    private int member_id;
    private String reply_content;
    private Date create_dt;
    private Date update_dt;

}