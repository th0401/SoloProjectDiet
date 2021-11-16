package model.diet;

import java.util.ArrayList;
import java.util.List;



public class DietPaging {
	private List<DietVO> originData;
	private List<DietVO> newDatas;
	private int index;
	public List<DietVO> getOriginData() {
		return originData;
	}
	public void setOriginData(List<DietVO> originData) {
		this.originData = originData;
	}
	public List<DietVO> getNewDatas() {
		return newDatas;
	}
	public void setNewDatas(List<DietVO> newDatas) {
		this.newDatas = newDatas;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	@Override
	public String toString() {
		return "DietPaging [originData=" + originData + ", newDatas=" + newDatas + ", index=" + index + "]";
	}
	
	public DietPaging(List<DietVO> originData, int index) {
		super();
		this.originData = originData;
		
		this.index = index;
		this.newDatas = new ArrayList<DietVO>();
	}

	public void excuteSlice() {
		for(int i=(this.index-1)*5; i<this.index*5; i++) { // 현재 인덱스에 -1*6~현재인덱스*6 까지의 데이터만 넘겨주기
			DietVO vo = this.originData.get(i);
			
			this.newDatas.add(vo);
			if(i==this.originData.size()-1) {// 6개 미만일 경우 break처리
				break;
			}
			
		}

	}
	
}
