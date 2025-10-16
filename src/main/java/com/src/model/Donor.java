package com.src.model;

import java.util.Objects;

import com.src.annotation.Column;
import com.src.annotation.Id;
import com.src.annotation.Table;

@Table(name = "donor")
public class Donor {

    @Id
    @Column(name = "donorId")
    private int donorId;

    @Column(name = "name", length = 100)
    private String donorName;

    @Column(name = "email", unique = true, length = 100)
    private String email;

    @Column(name = "phone", length = 20)
    private String phone;

    @Column(name = "address", length = 255)
    private String address;

    public Donor() {}

    public Donor(int donorId, String donorName, String email, String phone, String address) {
        this.donorId = donorId;
        this.donorName = donorName;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

	public int getDonorId() {
		return donorId;
	}

	public void setDonorId(int donorId) {
		this.donorId = donorId;
	}

	public String getDonorName() {
		return donorName;
	}

	public void setDonorName(String donorName) {
		this.donorName = donorName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, donorId, donorName, email, phone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Donor other = (Donor) obj;
		return Objects.equals(address, other.address) && donorId == other.donorId
				&& Objects.equals(donorName, other.donorName) && Objects.equals(email, other.email)
				&& Objects.equals(phone, other.phone);
	}

	@Override
	public String toString() {
		return "Donor [donorId=" + donorId + ", donorName=" + donorName + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + "]";
	}

}
