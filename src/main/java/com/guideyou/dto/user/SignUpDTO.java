package com.guideyou.dto.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpDTO {
    private String name;
    private String nickname;
    private String gender;
    private String email;
    private String phone;
    private String comment;
}
