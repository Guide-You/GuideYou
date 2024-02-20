package com.guideyou.dto.oauth.google;

import java.util.List;

import lombok.Data;
import lombok.ToString;

/**
 * @FileName : GooglePersonRespDTO.java
 * @Project : GuideYou
 * @Date : 2024. 2. 20.
 * @작성자 : 최장호
 * @변경이력 :
 * @프로그램 설명 : 구글 Person 응답 DTO - 이름, 전화번호, 성별
 */
@Data
@ToString
public class GooglePersonRespDTO {
    private String resourceName;
    private String etag;
    private List<Gender> genders;
    private List<EmailAddress> emailAddresses;
    private List<PhoneNumber> phoneNumbers;

    @Data
    public static class Gender {
        private Metadata metadata;
        private String value;
        private String formattedValue;
    }

    @Data
    public static class EmailAddress {
        private Metadata metadata;
        private String value;
    }

    @Data
    public static class PhoneNumber {
        private Metadata metadata;
        private String value;
        private String canonicalForm;
        private String type;
        private String formattedType;
    }

    @Data
    public static class Metadata {
        private boolean primary;
        private boolean verified;
        private Source source;
    }

    @Data
    public static class Source {
        private String type;
        private String id;
    }
}