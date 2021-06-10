package com.knock.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.command.Command;
import com.knock.mybatis.DBService;
public class RegisterController extends HttpServlet{
	public static SqlSession ss = DBService.getFactory().openSession();
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
