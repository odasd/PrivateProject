package com.example.domain;

public class pickTableVO {
	
	private int pnum;
	private int unum;
	private int pick;
	private int point;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public int getPick() {
		return pick;
	}
	public void setPick(int pick) {
		this.pick = pick;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "pickTableVO [pnum=" + pnum + ", unum=" + unum + ", pick=" + pick + ", point=" + point + "]";
	}
	
	
}
