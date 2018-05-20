<h1 align="center">Software development of programming languages database</h1>

<h1 align="center">Разработка ПО БД языков программирования на Lazarus (Pascal) с выводом в Excel</h1>
<h2>В базе данных храняться следующие данные: :page_facing_up:</h2>
<ul>
<li>о языке программирования:
  <ul>
    <li>Название языка программирования;</li>
    <li>Дата создания;</li>
    <li>Популярные библиотеки и фреймворки;</li>
    <li>История.</li>
  </ul>
 </li>
 <li>о категориях:
  <ul>
    <li>Класс языка.</li>
  </ul>
 </li>
 <li>об областях применения:
   <ul>
     <li>Область применения.</li>
   </ul>
 </li>
 <li>хранение данных о  категориях определенного языка программирования:
   <ul>
     <li>Название языка программирования;</li>
     <li>Класс языка.</li>
   </ul>
 </li>
 <li>хранение данных об областях применения определенного языка программирования:
  <ul>
    <li>Название языка программирования;</li>
    <li>Область применения.</li>
  </ul>
</li>
</ul>
<br>
<h2>Организация защиты информации хранящийся в базе данных :key: :lock:</h2>
<p>Защита информации хранящейся в базе данных организуется средствами MySQLServer. Доступ к базе данных может получить только 1 пользователь . Login – root, passwort – 090203. Кроме того, вход в программу под именем администратора производится с помощью логина-admin и пароля-090203.</p>
<br>
<h2>Модель структуры базы данных</h2> 
<img src="https://user-images.githubusercontent.com/37180024/40279344-8f639704-5c49-11e8-888c-388221fb741d.jpg">
<br>
<h2>Описание имеющегося функционала</h2>
  <ul>
    <li>Введение базы данных описания языков программирования с функциями добавления, удаления, редактирования данных и навигацией по базе данных;</li>
    <li>Введение базы данных категорий с функциями добавления, удаления, редактирования данных и навигацией по базе данных;</li>
    <li>Введение базы данных областей применения с функциями добавления, удаления, редактирования данных и навигацией по базе данных;</li>
    <li>Хранение данных о  категориях и областях применения для каждого из языков программирования;</li>
    <li>Выдача запросов  на сохранение записей перед закрытием формы, которые находятся в режиме редактирования;</li>
    <li>Проверка на наличие одинаковых записей;</li>
    <li>Поиск по введенному названию языка программирования;</li>
    <li>Вывод в Excel только тех таблиц, которые выберет сам пользователь.</li>
    <li>Вход в программу «под именем администратора/под обычным пользователем» и включающим различные привилегии в программе</li>
  </ul> 
<img src="https://user-images.githubusercontent.com/37180024/40279965-fe8ebcde-5c54-11e8-82f4-8aece9f3211f.jpg">
<br>
<h2>Примечание :exclamation:</h2>
  <ul>
    <li>Предже чем запускать программу необходимо востановить резервную копию sql-запроса (путь до файла "all files\MySQL\programming_languages.sql",
    а также создать или изменить соединение следующим образом:
    <ul type="none">
      <li><img src="https://user-images.githubusercontent.com/37180024/40279781-491e8ea4-5c51-11e8-9448-ee612b29d8d3.jpg"></li>
      <li><b>Пароль:</b> 090203</li>
    </ul>
    </li>
    <li> Если при запуске программы появляется ошибка, необходимо файл "libmysql.dll", который находится в папке "all files", скопировать в папку, имеющий путь "C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\". Если это не помогло, необходимо скопировать этот же файл в основные системные папки Windows (System, System32, SysWOW64)</li>
  </ul>
<br>
<br>
<br>
<h1 align="center">Software development of the database of programming languages on Lazarus (Pascal) with output in Excel</h1>  
<h2>The following data is stored in the database: :page_facing_up:</h2>
<ul>
  <li>about the programming language:
    <ul>
      <li>The name of the programming language;</li>
      <li>Date created;</li>
      <li>Popular libraries and frameworks;</li>
      <li>History.</li>
    </ul>
  </li>
  <li>about categories:
    <ul>
      <li>Language class.</li>
    </ul>
  </li>
  <li>about the fields of application:
    <ul>
      <li>Scope of application.</li>
    </ul>
  </li>
  <li>storing data about categories of a particular programming language:
    <ul>
      <li>The name of the programming language;</li>
      <li>Language class.</li>
    </ul>
  </li>
  <li>storing data about the application areas of a particular programming language:
    <ul>
      <li>The name of the programming language;</li>
      <li>Scope of application.</li>
    </ul>
  </li>
</ul>
