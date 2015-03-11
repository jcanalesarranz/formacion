package es.grupocmc.liferay.portlets.holaPortlet.controller;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

/**
 * Created by miguel on 11/3/15.
 */
public class MiControlador extends MVCPortlet {

    public void save(ActionRequest request, ActionResponse response) {

        System.out.println("Nombre: " + ParamUtil.getString(request, "nombre"));

    }

}
