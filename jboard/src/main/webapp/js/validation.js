// 유효성 검사에 사용할 정규표현식
const reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName = /^[가-힣]{2,10}$/
const reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

//유효성 검사에 사용할 상태변수
let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;

window.onload = function() {
	//아이디
	const btnCheck = document.getElementById('btnCheck');
	//이메일
	const btnSendEmail = document.getElementById('btnSendEmail');
	const btnAuthEmail = document.getElementById('btnAuthEmail');
	const registerForm = document.getElementsByTagName('form')[0];
	const resultId = document.getElementsByClassName('resultId')[0];
	//비밀번호
	const resultPass = document.getElementsByClassName('resultPass')[0];
	//이름
	const resultName = document.getElementsByClassName('resultName')[0];
	//별명
	const resultNick = document.getElementsByClassName('resultNick')[0];
	//이메일
	const resultEmail = document.getElementsByClassName('resultEmail')[0];
	const auth = document.getElementsByClassName('auth')[0];


	//휴대폰
	const resultHp = document.getElementsByClassName('resultHp')[0];
	// 1. 아이디 유효성 검사
	btnCheck.onclick = function() {

		const uid = registerForm.uid.value
		// 아이디 유효성 검사
		if (!uid.match(reUid)) {
			resultId.innerText = "아이디가 유효하지 않습니다";
			resultId.style.color = 'red';
			return;
		}

		// 중복성 검사		
		fetch('/jboard/user/checkUser.do?type=uid&value=' + uid)
			.then(resp => resp.json())
			.then(data => {
				console.log(data)

				if (data.result > 0) {
					resultId.innerText = "이미 사용중인 아이디 입니다";
					resultId.style.color = 'red';
					isUidOk = false;
				} else {
					resultId.innerText = "사용 가능한 아이디 입니다";
					resultId.style.color = 'green';
					isUidOk = true;
				}
			})
			.catch(err => {
				console.log(err)
			});
	}

	// 2. 비밀번호 유효성 검사
	registerForm.pass2.addEventListener('focusout', function() {
		const pass1 = registerForm.pass1.value;
		const pass2 = registerForm.pass2.value;
		if (!pass1.match(rePass)) {
			resultPass.innerText = "비밀번호가 유효하지 않습니다";
			resultPass.style.color = 'red';
			return;

		}

		if (pass1 == pass2) {
			resultPass.innerText = "비밀번호가 일치합니다";
			resultPass.style.color = 'green';
			isPassOk = true;
		} else {
			resultPass.innerText = "비밀번호가 일치하지 않습니다";
			resultPass.style.color = 'red';
			isPassOk = false;
		}
	});


	// 3. 아룸 유효성 검사
	registerForm.name.addEventListener('focusout', function() {
		const name = registerForm.name.value;
		if (!name.match(reName)) {
			resultName.innerText = "형식에 맞지 않습니다"
			resultName.style.color = 'red';
			isNameOk = false;
		} else {
			resultName.innerText = ""
			isNameOk = true;
		}
	});
	// 4. 별명 유효성 검사
	registerForm.nick.addEventListener('focusout', function() {
		const nick = registerForm.nick.value;
		if (!nick.match(reNick)) {
			resultNick.innerText = "형식에 맞지 않습니다";
			resultNick.style.color = 'red';
			isNickOk = false;
			return;
		} else {
			resultNick.innerText = "";
			isNickOk = true;
		}
		fetch('/jboard/user/checkUser.do?type=nick&value=' + nick)
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				if (data.result > 0) {
					resultNick.innerText = "이미 사용중인";
					resultNick.style.color = 'red';
				} else {
					resultNick.innerText = "사용가능한";
					resultNick.style.color = 'green';


				}
			})
			.catch(err => {
				console.log(err);
			});

	});
	// 5. 이메일 유효성 검사
	let preventDblclick = false;

	btnSendEmail.onclick = async function() {
		const email = registerForm.email.value;
		if (preventDblclick) {
			return;
		}
		if (!email.match(reEmail)) {
			resultEmail.innerText = ('유효한 이메일이 아닙니다');
			resultEmail.style.color = 'red';
			return;
		}
		try {
			preventDblclick = true;
			const resp = await fetch('/jboard/user/checkUser.do?type=email&value=' + email);
			const data = await resp.json();
			console.log(data);

			if (data.result > 0) {
				resultEmail.innerText = "이미 사용중인 이메일입니다"
				resultEmail.style.color = 'red'
			} else {
				resultEmail.innerText = "인증코드가 발송 되었습니다."
				resultEmail.style.color = 'green'

				auth.style.display = 'block';
			}

		} catch (e) {
			console.log(e)
		}
	}

	btnAuthEmail.onclick = function() {
		const code = registerForm.auth.value;

		fetch('/jboard/user/checkUser.do', {
			method: 'POST',
			body: JSON.stringify({ "code": code })
		})
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				if (data.result > 0) {
					resultEmail.innerText = "이메일이 인증되었습니다";
					resultEmail.style.color = 'green';
					isEmailOk = true;
				} else {
					resultEmail.innerText = "유효한인증 코드가 없습니다";
					resultEmail.style.color = 'red';
					isEmailOk = false;
				}
			})
			.catch(err => {
				console.log(err);
			})

	}
	// 6. 휴대폰 유효성 검사
	registerForm.hp.addEventListener('focusout', async function() {
		const hp = registerForm.hp.value;

		try {
			const resp = await fetch('/jboard/user/checkUser.do?type=hp&value=' + hp)
			const data = await resp.json();
			console.log(data);
			
			if (data.result > 0) {
				resultHp.innerText = "이미 사용중인 번호입니다";
				resultHp.style.color = 'red';
				isHpOk = false;
			} else {
				resultHp.innerText = "";
				isHpOk = true;
			}
		} catch (err) {
			console.log(err);

		}
	});


	//최종
	registerForm.onsubmit = function() {
		//아이디 유효성 완료 여부
		if (!isUidOk) {
			alert('아이디가 확인좀');
			return false;
		}
		//비밀번호 유효성 완료 여부
		if (!isPassOk) {
			alert('비밀번호가 가 틀리다');
			return false;
		}
		//이름 유효성 완료 여부
		if (!isNameOk) {
			alert('이름이 유효하지 않습니다');
			return false;
		}
		//별명 유효성 완료 여부
		if (!isNickOk) {
			alert('별명이 유효하지 않습니다');
			return false;
		}
		//이메일 유효성 완료 여부
		if (!isEmailOk) {
			alert('이메일 인증이 안됬다 ');
			return false;
		}
		//번호 유효성 완료 여부
		/*if(!isHpOk){
			alert('휴대폰이 번호가 없다');
			return false;			
		}*/
		return true;
	}

}