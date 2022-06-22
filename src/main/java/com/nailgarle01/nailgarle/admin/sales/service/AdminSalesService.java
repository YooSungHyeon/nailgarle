package com.nailgarle01.nailgarle.admin.sales.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;

public interface AdminSalesService {
	public List<AdminSalesVO> adminMainList(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException;
	public AdminSalesVO adminAllSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException;
	public AdminSalesVO adminOneSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException;
}
