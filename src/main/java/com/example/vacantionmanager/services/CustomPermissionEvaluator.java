package com.example.vacantionmanager.services;

import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import java.io.Serializable;

public class CustomPermissionEvaluator implements PermissionEvaluator {
    @Override
    public boolean hasPermission(Authentication authentication, Object targetDomainObject, Object permission) {
        if((authentication==null)
                || (targetDomainObject==null)||
                !(permission instanceof String)){
            System.out.println("sleep");
            return false;
        }
        String targetType=
                targetDomainObject.getClass().getSimpleName().toUpperCase();
        System.out.println("work");
        return hasPrivilege(authentication,targetType,permission.toString().toUpperCase());
    }

    @Override
    public boolean hasPermission(Authentication authentication, Serializable targetId, String targetType, Object permission) {
        if ((authentication==null)||(targetType==null)||!(permission instanceof  String)){
            System.out.println("slept");
            return false;
        }
        System.out.println("working...");
        return hasPrivilege(authentication,targetType,permission.toString().toUpperCase());

    }


    private boolean hasPrivilege(Authentication auth,String targetType,String permission){
        for (GrantedAuthority grantedAuthority:auth.getAuthorities()){
            if(grantedAuthority.getAuthority().startsWith(targetType) &&
                    grantedAuthority.getAuthority().contains(permission)){
                System.out.println("here");
                return true;
            }
        }
        System.out.println("not here");
        return false;
    }
}