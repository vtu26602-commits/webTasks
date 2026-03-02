const express = require("express");
const mysql = require("mysql2");
const path = require("path");

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "joshi.poi",
    database: "new_login"
});

db.connect((err) => {
    if (err) {
        console.log("Database connection failed:", err);
    } else {
        console.log("Connected to MySQL");
    }
});

app.get("/", (req, res) => {
    res.redirect("/registration.html");
});
app.post("/register", (req, res) => {

    console.log("Form Data:", req.body);   // 👈 ADD THIS

    const { Username, mail, dob, Usernumber, dept } = req.body;

    const sql = `
        INSERT INTO userDetailsSample (Username, mail, dob, Usernumber, dept)
        VALUES (?, ?, ?, ?, ?)
    `;

    db.query(sql, [Username, mail, dob, Usernumber, dept], (err) => {
        if (err) {
            console.log("Insert Error:", err);  // 👈 IMPORTANT
            return res.send("Error: " + err.message); // 👈 SHOW REAL ERROR
        } else {
            res.send("<h2>Registration Successful</h2><a href='/'>Back</a>");
        }
    });
});

app.get("/students", (req, res) => {

    db.query("SELECT * FROM userDetailsSample", (err, results) => {

        if (err) {
    console.log("Insert Error:", err);
    return res.send("Error: " + err.message);
        } else {

            let output = `
                <h2>Registered Students</h2>
                <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>DOB</th>
                    <th>Phone</th>
                    <th>Department</th>
                </tr>
            `;

            results.forEach(student => {
                output += `
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.Username}</td>
                        <td>${student.mail}</td>
                        <td>${student.dob}</td>
                        <td>${student.Usernumber}</td>
                        <td>${student.dept}</td>
                    </tr>
                `;
            });

            output += "</table><br><a href='/'>Back</a>";

            res.send(output);
        }
    });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});