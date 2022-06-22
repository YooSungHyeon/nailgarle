package com.nailgarle01.nailgarle.admin.sales.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;

@Repository("adminSalesDAO")
public class AdminSalesDAOImpl implements AdminSalesDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminSalesVO> selectAdminSalesList(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException {
		AdminSalesVO SalesVO = new AdminSalesVO();
		String startDate = adminSalesVO.getStartDate();
		if (startDate.equals("n")) {			
			startDate=selectMin();
		}
		String endDate = adminSalesVO.getEndDate();
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
		int secNum = adminSalesVO.getSecNum();
		int pageNum = adminSalesVO.getPageNum();        
        
		long diffDays=Math.abs(format1.getTime() - format2.getTime()) / (1000 * 3600 * 24);
		int roop = Long.valueOf(diffDays).intValue()+1;
		if((roop-((pageNum-1)*10)-((secNum-1)*100))>10) {
			roop=10;
		}else if((roop-((pageNum-1)*10)-((secNum-1)*100))<=0){
			roop=0;
		}else {
			roop=roop%10;
		}
		List<AdminSalesVO> adminSalesList = new ArrayList<AdminSalesVO>();
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(format2);
		cal1.add(Calendar.DATE, 1);
		cal1.add(Calendar.DATE, -((pageNum-1)*10)-((secNum-1)*100));
		for (int i = 0; i < roop; i++) {
		format1 = new Date(cal1.getTimeInMillis());
		String start = format1.toInstant().atOffset(ZoneOffset.UTC).format( DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		startDate = start+" 00:00:00";
		endDate = start+" 23:59:59";
		adminSalesVO.setStartDate(startDate);
		adminSalesVO.setEndDate(endDate);	
		SalesVO = (AdminSalesVO) sqlSession.selectOne("mapper.admin.sales.selectAdminSalesList", adminSalesVO);
		if(SalesVO ==null) {
			SalesVO = new AdminSalesVO();
		}
		SalesVO.setStartDate(start);
		adminSalesList.add(SalesVO);
		cal1.add(Calendar.DATE, -1);
		}
		return adminSalesList;
	}
	@Override
	public AdminSalesVO selectAllAdminSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException {
		AdminSalesVO SalesVO = new AdminSalesVO();
		String start = adminSalesVO.getStartDate();
		if (start.equals("n")) {			
			start = selectMin()+" 00:00:00";
		}
		String end = adminSalesVO.getEndDate()+" 23:59:59";
		adminSalesVO.setStartDate(start);
		adminSalesVO.setEndDate(end);
		SalesVO = (AdminSalesVO) sqlSession.selectOne("mapper.admin.sales.selectAdminSalesList", adminSalesVO);
		return SalesVO;
	}
	
	@Override
	public AdminSalesVO selectOneAdminSales(AdminSalesVO adminSalesVO) throws DataAccessException, ParseException {
		AdminSalesVO SalesVO = new AdminSalesVO();
		String date = adminSalesVO.getStartDate();
		String startDate = adminSalesVO.getStartDate()+" 00:00:00";
		String endDate = adminSalesVO.getEndDate()+" 23:59:59";
		adminSalesVO.setStartDate(startDate);
		adminSalesVO.setEndDate(endDate);
		SalesVO = (AdminSalesVO) sqlSession.selectOne("mapper.admin.sales.selectAdminSalesList", adminSalesVO);
		if(SalesVO ==null) {
			SalesVO = new AdminSalesVO();
		}
		SalesVO.setStartDate(date);
		return SalesVO;
	}
	
	private String selectMin() throws DataAccessException {
		return (String) sqlSession.selectOne("mapper.admin.sales.selectMin");
	}
}
