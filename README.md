# README

Blog desenvolvido em Ruby on Rails utilizando o postgresql.

Models:
    - Administradores (Admin)
    - Usuários (User)
    - Postagem (Post)
    - Comentários (Comment)
Controllers:
    - Administradores (admins)
    - Usuários (users)
    - Postagem (posts)
    - Comentários (comments)
    - Painel Admnistrativo (dashboards)

O blog possui dois tipos de logins (usuários e administradores), onde só quem pode publicar uma postagem é o admnistrador e só quem pode
criar um comentário é o usuário. Comentários são salvos utilizando AJAX para evitar a necessidade de recarregamento da página.

