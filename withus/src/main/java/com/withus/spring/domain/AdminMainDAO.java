package com.withus.spring.domain;

import java.util.List;

public interface AdminMainDAO {
	// 어드민 카테고리
	public abstract List<SellerMainDTO> admin_category();

	// 어드민 올해 금액
	public abstract List<SellerMainDTO> admin_totalPrice();

	// 어드민 작년 총 금액
	public abstract List<SellerMainDTO> admin_lastTotalPrice();
}
