package com.example.interceptors;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.example.actions.UserAction;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

public class SessionInterceptor extends AbstractInterceptor {
    
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> session = invocation.getInvocationContext().getSession();
        
        // Excluir acciones de login y páginas públicas
        String actionName = invocation.getProxy().getActionName();
        if ("login".equals(actionName) || "logout".equals(actionName)) {
            return invocation.invoke();
        }
        
        // Verificar sesión
        if (session == null || session.get("user") == null) {
            return "loginRedirect";
        }
        
        return invocation.invoke();
    }
}