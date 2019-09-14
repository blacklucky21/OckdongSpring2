package com.junwo.ockdong.myOwn.model.vo;

public class MBLRecipe {
	private int mblId;
	private String mblTitle;
	private String mblType;
	private String userId;
	private String numbers;
	private int riceNm;
	private String riceType;
	private String riceName;
	private String riceFileName;
	private int mainNm;
	private String mainType;
	private String mainName;
	private String mainFileName;
	private int sub1Nm;
	private String sub1Type;
	private String sub1Name;
	private String sub1FileName;
	private int sub2Nm;
	private String sub2Type;
	private String sub2Name;
	private String sub2FileName;
	private int soupNm;
	private String soupType;
	private String soupName;
	private String soupFileName;
	private String createDate;
	private String mblFileName;
	private String status;
	
	public MBLRecipe() {}

	public MBLRecipe(int mblId, String mblTitle, String mblType, String userId, String numbers, String createDate,
			String mblFileName, String status) {
		super();
		this.mblId = mblId;
		this.mblTitle = mblTitle;
		this.mblType = mblType;
		this.userId = userId;
		this.numbers = numbers;
		this.createDate = createDate;
		this.mblFileName = mblFileName;
		this.status = status;
	}

	public MBLRecipe(int mblId, String mblTitle, String mblType, String userId, String numbers, int riceNm,
			String riceType, String riceName, String riceFileName, int mainNm, String mainType, String mainName,
			String mainFileName, int sub1Nm, String sub1Type, String sub1Name, String sub1FileName, int sub2Nm,
			String sub2Type, String sub2Name, String sub2FileName, String createDate, String mblFileName,
			String status) {
		super();
		this.mblId = mblId;
		this.mblTitle = mblTitle;
		this.mblType = mblType;
		this.userId = userId;
		this.numbers = numbers;
		this.riceNm = riceNm;
		this.riceType = riceType;
		this.riceName = riceName;
		this.riceFileName = riceFileName;
		this.mainNm = mainNm;
		this.mainType = mainType;
		this.mainName = mainName;
		this.mainFileName = mainFileName;
		this.sub1Nm = sub1Nm;
		this.sub1Type = sub1Type;
		this.sub1Name = sub1Name;
		this.sub1FileName = sub1FileName;
		this.sub2Nm = sub2Nm;
		this.sub2Type = sub2Type;
		this.sub2Name = sub2Name;
		this.sub2FileName = sub2FileName;
		this.createDate = createDate;
		this.mblFileName = mblFileName;
		this.status = status;
	}

	public MBLRecipe(int mblId, String mblTitle, String mblType, String userId, String numbers, int riceNm,
			String riceType, String riceName, String riceFileName, int mainNm, String mainType, String mainName,
			String mainFileName, int sub1Nm, String sub1Type, String sub1Name, String sub1FileName, int sub2Nm,
			String sub2Type, String sub2Name, String sub2FileName, int soupNm, String soupType, String soupName,
			String soupFileName, String createDate, String mblFileName, String status) {
		super();
		this.mblId = mblId;
		this.mblTitle = mblTitle;
		this.mblType = mblType;
		this.userId = userId;
		this.numbers = numbers;
		this.riceNm = riceNm;
		this.riceType = riceType;
		this.riceName = riceName;
		this.riceFileName = riceFileName;
		this.mainNm = mainNm;
		this.mainType = mainType;
		this.mainName = mainName;
		this.mainFileName = mainFileName;
		this.sub1Nm = sub1Nm;
		this.sub1Type = sub1Type;
		this.sub1Name = sub1Name;
		this.sub1FileName = sub1FileName;
		this.sub2Nm = sub2Nm;
		this.sub2Type = sub2Type;
		this.sub2Name = sub2Name;
		this.sub2FileName = sub2FileName;
		this.soupNm = soupNm;
		this.soupType = soupType;
		this.soupName = soupName;
		this.soupFileName = soupFileName;
		this.createDate = createDate;
		this.mblFileName = mblFileName;
		this.status = status;
	}

	public int getMblId() {
		return mblId;
	}

	public void setMblId(int mblId) {
		this.mblId = mblId;
	}

	public String getMblTitle() {
		return mblTitle;
	}

	public void setMblTitle(String mblTitle) {
		this.mblTitle = mblTitle;
	}

	public String getMblType() {
		return mblType;
	}

	public void setMblType(String mblType) {
		this.mblType = mblType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNumbers() {
		return numbers;
	}

	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}

	public int getRiceNm() {
		return riceNm;
	}

	public void setRiceNm(int riceNm) {
		this.riceNm = riceNm;
	}

	public String getRiceType() {
		return riceType;
	}

	public void setRiceType(String riceType) {
		this.riceType = riceType;
	}

	public String getRiceName() {
		return riceName;
	}

	public void setRiceName(String riceName) {
		this.riceName = riceName;
	}

	public String getRiceFileName() {
		return riceFileName;
	}

	public void setRiceFileName(String riceFileName) {
		this.riceFileName = riceFileName;
	}

	public int getMainNm() {
		return mainNm;
	}

	public void setMainNm(int mainNm) {
		this.mainNm = mainNm;
	}

	public String getMainType() {
		return mainType;
	}

	public void setMainType(String mainType) {
		this.mainType = mainType;
	}

	public String getMainName() {
		return mainName;
	}

	public void setMainName(String mainName) {
		this.mainName = mainName;
	}

	public String getMainFileName() {
		return mainFileName;
	}

	public void setMainFileName(String mainFileName) {
		this.mainFileName = mainFileName;
	}

	public int getSub1Nm() {
		return sub1Nm;
	}

	public void setSub1Nm(int sub1Nm) {
		this.sub1Nm = sub1Nm;
	}

	public String getSub1Type() {
		return sub1Type;
	}

	public void setSub1Type(String sub1Type) {
		this.sub1Type = sub1Type;
	}

	public String getSub1Name() {
		return sub1Name;
	}

	public void setSub1Name(String sub1Name) {
		this.sub1Name = sub1Name;
	}

	public String getSub1FileName() {
		return sub1FileName;
	}

	public void setSub1FileName(String sub1FileName) {
		this.sub1FileName = sub1FileName;
	}

	public int getSub2Nm() {
		return sub2Nm;
	}

	public void setSub2Nm(int sub2Nm) {
		this.sub2Nm = sub2Nm;
	}

	public String getSub2Type() {
		return sub2Type;
	}

	public void setSub2Type(String sub2Type) {
		this.sub2Type = sub2Type;
	}

	public String getSub2Name() {
		return sub2Name;
	}

	public void setSub2Name(String sub2Name) {
		this.sub2Name = sub2Name;
	}

	public String getSub2FileName() {
		return sub2FileName;
	}

	public void setSub2FileName(String sub2FileName) {
		this.sub2FileName = sub2FileName;
	}

	public int getSoupNm() {
		return soupNm;
	}

	public void setSoupNm(int soupNm) {
		this.soupNm = soupNm;
	}

	public String getSoupType() {
		return soupType;
	}

	public void setSoupType(String soupType) {
		this.soupType = soupType;
	}

	public String getSoupName() {
		return soupName;
	}

	public void setSoupName(String soupName) {
		this.soupName = soupName;
	}

	public String getSoupFileName() {
		return soupFileName;
	}

	public void setSoupFileName(String soupFileName) {
		this.soupFileName = soupFileName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getMblFileName() {
		return mblFileName;
	}

	public void setMblFileName(String mblFileName) {
		this.mblFileName = mblFileName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MBLRecipe [mblId=" + mblId + ", mblTitle=" + mblTitle + ", mblType=" + mblType + ", userId=" + userId
				+ ", numbers=" + numbers + ", riceNm=" + riceNm + ", riceType=" + riceType + ", riceName=" + riceName
				+ ", riceFileName=" + riceFileName + ", mainNm=" + mainNm + ", mainType=" + mainType + ", mainName="
				+ mainName + ", mainFileName=" + mainFileName + ", sub1Nm=" + sub1Nm + ", sub1Type=" + sub1Type
				+ ", sub1Name=" + sub1Name + ", sub1FileName=" + sub1FileName + ", sub2Nm=" + sub2Nm + ", sub2Type="
				+ sub2Type + ", sub2Name=" + sub2Name + ", sub2FileName=" + sub2FileName + ", soupNm=" + soupNm
				+ ", soupType=" + soupType + ", soupName=" + soupName + ", soupFileName=" + soupFileName
				+ ", createDate=" + createDate + ", mblFileName=" + mblFileName + ", status=" + status + "]";
	}
	
}
