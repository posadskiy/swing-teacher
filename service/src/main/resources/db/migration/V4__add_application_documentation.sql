-- Flyway migration V4: add application documentation

-- Application documentation (ID 0 is reserved for application documentation)
INSERT INTO documentation (id, text)
VALUES (0, '<h1>SwingTeacher Desktop Application</h1>
<h2>Welcome to SwingTeacher Desktop</h2>
<p>SwingTeacher Desktop is an educational application designed to help you learn Java programming through interactive tasks and lessons.</p>

<h2>Getting Started</h2>
<h3>Registration</h3>
<p>To get started, you need to create an account:</p>
<ol>
  <li>Click on the "Register" button on the login screen</li>
  <li>Enter your login, password, and email address</li>
  <li>Click "Register" to create your account</li>
  <li>You will be automatically logged in after registration</li>
</ol>

<h3>Login</h3>
<p>To access the application:</p>
<ol>
  <li>Enter your login and password</li>
  <li>Click "Login" to access the main application</li>
</ol>

<h2>Using the Application</h2>
<h3>Lessons and Tasks</h3>
<p>The main window displays:</p>
<ul>
  <li><strong>Lesson:</strong> Select a lesson from the dropdown menu</li>
  <li><strong>Task:</strong> Choose a task from the selected lesson</li>
  <li><strong>Question:</strong> Read the task question in the question panel</li>
  <li><strong>Documentation:</strong> View reference information for the current task</li>
  <li><strong>Solution:</strong> Write your Java code solution in the solution panel</li>
</ul>

<h3>Working with Tasks</h3>
<p>To complete a task:</p>
<ol>
  <li>Select a lesson and task from the dropdown menus</li>
  <li>Read the question and documentation</li>
  <li>Write your solution in the solution panel (Java code editor)</li>
  <li>Click "View" to compile and run your code</li>
  <li>Click "Check" to verify your solution</li>
</ol>

<h3>Features</h3>
<ul>
  <li><strong>Code Editor:</strong> Syntax-highlighted Java code editor with autocomplete</li>
  <li><strong>Auto-completion:</strong> Keywords and code snippets are available via autocomplete</li>
  <li><strong>Task Tracking:</strong> Completed tasks are marked with a checkmark (☑)</li>
  <li><strong>Progress Tracking:</strong> Your progress is saved automatically</li>
</ul>

<h2>Menu Options</h2>
<h3>Settings Menu</h3>
<ul>
  <li><strong>New user:</strong> Register a new account</li>
  <li><strong>Change user:</strong> Log out and switch to another account</li>
  <li><strong>Exit:</strong> Close the application</li>
</ul>

<h3>Help Menu</h3>
<ul>
  <li><strong>Documentation:</strong> View this help documentation</li>
  <li><strong>About:</strong> View application information</li>
</ul>

<h2>Tips</h2>
<ul>
  <li>Use the autocomplete feature (Ctrl+Space) to quickly insert code snippets</li>
  <li>Read the documentation panel for each task to understand the requirements</li>
  <li>Check your code with "View" before submitting with "Check"</li>
  <li>Completed tasks are marked with a checkmark for easy identification</li>
</ul>

<h2>Support</h2>
<p>If you encounter any issues or have questions, please contact the application administrator.</p>

<p><em>Happy coding!</em></p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

