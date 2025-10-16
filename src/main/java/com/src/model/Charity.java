package com.src.model;

import java.util.Objects;

import com.src.annotation.Column;
import com.src.annotation.Id;
import com.src.annotation.Table;

@Table(name = "charity")
public class Charity {

    @Id
    @Column(name = "charityId")
    private int charityId;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "regNo", unique = true, length = 50)
    private String regNo;

    @Column(name = "contact", length = 100)
    private String contact;

    @Column(name = "description")
    private String description;

	public int getCharityId() {
		return charityId;
	}

	public void setCharityId(int charityId) {
		this.charityId = charityId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(charityId, contact, description, name, regNo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Charity other = (Charity) obj;
		return charityId == other.charityId && Objects.equals(contact, other.contact)
				&& Objects.equals(description, other.description) && Objects.equals(name, other.name)
				&& Objects.equals(regNo, other.regNo);
	}

	public Charity(int charityId, String name, String regNo, String contact, String description) {
		super();
		this.charityId = charityId;
		this.name = name;
		this.regNo = regNo;
		this.contact = contact;
		this.description = description;
	}
	public Charity() {
		
	}

}
