package com.nailgarle01.nailgarle.goods.vo;

import java.sql.Date;

public class ImageFileVO {
	private int p_imageNum;
	private int productNum;
	private String fileName;
	private String regId;
	private String fileType;
	private Date p_imageRegDate;
	public int getP_imageNum() {
		return p_imageNum;
	}
	public void setP_imageNum(int p_imageNum) {
		this.p_imageNum = p_imageNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Date getP_imageRegDate() {
		return p_imageRegDate;
	}
	public void setP_imageRegDate(Date p_imageRegDate) {
		this.p_imageRegDate = p_imageRegDate;
	}
}
