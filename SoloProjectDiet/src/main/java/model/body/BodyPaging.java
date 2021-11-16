package model.body;

import java.util.ArrayList;
import java.util.List;



public class BodyPaging {
	private List<BodyVO> originData;
	private List<BodyVO> newDatas;
	private int index;


	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public List<BodyVO> getOriginData() {
		return originData;
	}
	public void setOriginData(List<BodyVO> originData) {
		this.originData = originData;
	}
	public List<BodyVO> getNewDatas() {
		return newDatas;
	}
	public void setNewDatas(List<BodyVO> newDatas) {
		this.newDatas = newDatas;
	}
	

	public BodyPaging(List<BodyVO> originData, int index) {
		super();
		this.originData = originData;
		
		this.index = index;
		this.newDatas = new ArrayList<BodyVO>();
	}

	public void excuteSlice() {
		for(int i=(this.index-1)*6; i<this.index*6; i++) { // 현재 인덱스에 -1*6~현재인덱스*6 까지의 데이터만 넘겨주기
			BodyVO vo = this.originData.get(i);
			
			this.newDatas.add(vo);
			if(i==this.originData.size()-1) {// 6개 미만일 경우 break처리
				break;
			}
			
		}

	}
}
