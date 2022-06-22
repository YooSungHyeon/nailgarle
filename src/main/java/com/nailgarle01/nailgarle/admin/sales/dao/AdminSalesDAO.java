package com.nailgarle01.nailgarle.admin.sales.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;

public interface AdminSalesDAO {
	public List<AdminSalesVO> selectAdminSalesList(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException;
	public AdminSalesVO selectAllAdminSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException;
	public AdminSalesVO selectOneAdminSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException; 
}
