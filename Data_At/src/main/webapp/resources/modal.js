  // 모달 열기/닫기
    const openModalBtn = document.getElementById('openModalBtn');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const loginModal = document.getElementById('loginModal');

    openModalBtn.addEventListener('click', () => {
    loginModal.style.display = 'block';
    console.log('modal on');
    });
    
    closeModalBtn.addEventListener('click', () => loginModal.style.display = 'none');
    
    window.addEventListener('click', (e) => {
        if (e.target === loginModal) loginModal.style.display = 'none';
    });


    // 로그인/회원가입 폼 전환
    const loginLink = document.getElementById('login-box-link');
    const signupLink = document.getElementById('signup-box-link');
    const loginForm = document.querySelector('.email-login');
    const signupForm = document.querySelector('.email-signup');

    signupLink.addEventListener('click', () => {
    	console.log('signup clicked');
        loginForm.style.display = 'none';
        signupForm.style.display = 'block';
        loginLink.classList.remove('active');
        signupLink.classList.add('active');
    });

    loginLink.addEventListener('click', () => {
    	console.log('login clicked');
        loginForm.style.display = 'block';
        signupForm.style.display = 'none';
        signupLink.classList.remove('active');
        loginLink.classList.add('active');
    });