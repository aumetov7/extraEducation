package com.aumetov.extraEducation.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER,
    ADMIN,
    DIRECTOR,
    BAN;

    @Override
    public String getAuthority() {
        return name();
    }
}
