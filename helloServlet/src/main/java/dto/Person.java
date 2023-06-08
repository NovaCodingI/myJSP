package dto;

public class Person {

	// 이름과 나이를 필드로 가지고있고
	private String name;
	private int age;
	
	
	public Person() {
		// TODO Auto-generated constructor stub
	}

	
	// 매개변수를 받아서 세팅하는 객체가 하나 만들어졌어요
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
