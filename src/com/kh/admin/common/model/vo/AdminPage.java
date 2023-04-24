package com.kh.admin.common.model.vo;

public class AdminPage {
	private int totalMemberCount;
	private int totalPaymentAmount;
	private int inquiryNullCount;
	private int inquiryNotNullCount;
	private int maleCount;
	private int femaleCount;
	private int uncheckedCount;
	private int etc;
	private int protein;
	private int lunch;
	private int noSugar;
	private int zero;


	public AdminPage() {}



	public AdminPage(int totalMemberCount, int totalPaymentAmount, int inquiryNullCount, int inquiryNotNullCount,
			int maleCount, int femaleCount, int uncheckedCount, int etc, int protein, int lunch, int noSugar,
			int zero) {
		super();
		this.totalMemberCount = totalMemberCount;
		this.totalPaymentAmount = totalPaymentAmount;
		this.inquiryNullCount = inquiryNullCount;
		this.inquiryNotNullCount = inquiryNotNullCount;
		this.maleCount = maleCount;
		this.femaleCount = femaleCount;
		this.uncheckedCount = uncheckedCount;
		this.etc = etc;
		this.protein = protein;
		this.lunch = lunch;
		this.noSugar = noSugar;
		this.zero = zero;
	}



	public int getTotalMemberCount() {
		return totalMemberCount;
	}

	public void setTotalMemberCount(int totalMemberCount) {
		this.totalMemberCount = totalMemberCount;
	}

	public int getTotalPaymentAmount() {
		return totalPaymentAmount;
	}

	public void setTotalPaymentAmount(int totalPaymentAmount) {
		this.totalPaymentAmount = totalPaymentAmount;
	}

	public int getInquiryNullCount() {
		return inquiryNullCount;
	}

	public void setInquiryNullCount(int inquiryNullCount) {
		this.inquiryNullCount = inquiryNullCount;
	}

	public int getInquiryNotNullCount() {
		return inquiryNotNullCount;
	}

	public void setInquiryNotNullCount(int inquiryNotNullCount) {
		this.inquiryNotNullCount = inquiryNotNullCount;
	}

	public int getMaleCount() {
		return maleCount;
	}

	public void setMaleCount(int maleCount) {
		this.maleCount = maleCount;
	}

	public int getFemaleCount() {
		return femaleCount;
	}

	public void setFemaleCount(int femaleCount) {
		this.femaleCount = femaleCount;
	}

	public int getUncheckedCount() {
		return uncheckedCount;
	}

	public void setUncheckedCount(int uncheckedCount) {
		this.uncheckedCount = uncheckedCount;
	}
	
	public int getEtc() {
		return etc;
	}

	public void setEtc(int etc) {
		this.etc = etc;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getLunch() {
		return lunch;
	}

	public void setLunch(int lunch) {
		this.lunch = lunch;
	}

	public int getNoSugar() {
		return noSugar;
	}

	public void setNoSugar(int noSugar) {
		this.noSugar = noSugar;
	}

	public int getZero() {
		return zero;
	}

	public void setZero(int zero) {
		this.zero = zero;
	}
	

	@Override
	public String toString() {
		return "AdminPage [totalMemberCount=" + totalMemberCount + ", totalPaymentAmount=" + totalPaymentAmount
				+ ", inquiryNullCount=" + inquiryNullCount + ", inquiryNotNullCount=" + inquiryNotNullCount
				+ ", maleCount=" + maleCount + ", femaleCount=" + femaleCount + ", uncheckedCount=" + uncheckedCount
				+ "]";
	}

}
