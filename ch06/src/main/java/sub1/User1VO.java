package sub1;

public class User1VO {

		private String uid;
		private String name;
		private String birth;
		private String hp;
		private String age;
		@Override
		public String toString() {
			return "User1VO [uid=" + uid + ", name=" + name + ", birth=" + birth + ", hp=" + hp + ", age=" + age + "]";
		}
		public String getUid() {
			return uid;
		}
		public void setUid(String uid) {
			this.uid = uid;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getBirth() {
			return birth;
		}
		public void setBirth(String birth) {
			this.birth = birth;
		}
		public String getHp() {
			return hp;
		}
		public void setHp(String hp) {
			this.hp = hp;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}

}
