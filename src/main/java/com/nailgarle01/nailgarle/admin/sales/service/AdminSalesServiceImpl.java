package com.nailgarle01.nailgarle.admin.sales.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.admin.sales.dao.AdminSalesDAO;
import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;

@Service("adminSalesService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminSalesServiceImpl implements AdminSalesService{
	@Autowired
	private AdminSalesDAO adminSalesDAO;
	
	public List<AdminSalesVO> adminMainList(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException{
		List<AdminSalesVO> adminSalesList = adminSalesDAO.selectAdminSalesList(adminSalesVO);		
		return adminSalesList;
	}
	
	public AdminSalesVO adminAllSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException{
		AdminSalesVO salesVO = adminSalesDAO.selectAllAdminSales(adminSalesVO);		
		return salesVO;
	}
	public AdminSalesVO adminOneSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException{
		AdminSalesVO salesVO = adminSalesDAO.selectOneAdminSales(adminSalesVO);		
		return salesVO;
	}
}
