document.addEventListener('DOMContentLoaded', function() {
    // Загрузка существующих записей при загрузке страницы
    loadExistingComments();

    document.getElementById('submitBtn').addEventListener('click', function(event) {
        event.preventDefault();

        const name = document.querySelector('input[name="name"]').value;
        const email = document.querySelector('input[name="email"]').value;
        const comment = document.querySelector('textarea[name="comment"]').value;


        // Валидация данных
        if (!name || !email || !comment) {
            alert('Пожалуйста, заполните все поля');
            return;
        }

        if (name.length > 50) {
            alert('Имя не должно превышать 50 символов');
            return;
        }

        if (!validateName(name)) {
            alert('Имя не должно содержать пробелы');
            return;
        }

        if (!validateEmail(email)) {
            alert('Пожалуйста, введите корректный email');
            return;
        }

        if (comment.length > 500) {
            alert('Комментарий не должен превышать 500 символов');
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open('POST', './php/add_comment.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {

                const response = JSON.parse(xhr.responseText);

                // Создаем новую карточку с данными пользователя
                createCommentCard(response);

                document.getElementById('commentForm').reset();

                // Загружаем обновленный список комментариев
                loadExistingComments();
            }
        };
        xhr.send('name=' + name + '&email=' + email + '&comment=' + comment);
    });
});

function validateEmail(email) {
    const re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function validateName(name) {
    const re = /^\S*$/;
    return re.test(name);
}

function loadExistingComments() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', './php/get_comment.php', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById('commentBlock').innerHTML = '';

            const responses = JSON.parse(xhr.responseText);
            responses.forEach(function(response) {
                createCommentCard(response);
            });
        }
    };
    xhr.send();
}

function createCommentCard(response) {
    const commentBlock = document.getElementById('commentBlock');

    const card = document.createElement('div');
    card.classList.add('comment-card');

    const nameElement = document.createElement('div');
    nameElement.classList.add('name');
    nameElement.innerText = response.name;

    const emailCommentDiv = document.createElement('div');
    emailCommentDiv.classList.add('email-comment');
    emailCommentDiv.innerHTML =
        `<div><strong>${response.email}</strong></div>
         <div>${response.comment}</div>`;

    card.appendChild(nameElement);
    card.appendChild(emailCommentDiv);

    commentBlock.appendChild(card);
}