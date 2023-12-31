package main

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"

	h "JewelryShop/handlers"
	"os"

	"github.com/joho/godotenv"

	"github.com/gin-contrib/cors"
	"github.com/gorilla/sessions"
)

type User struct {
	Id          string `json:"id"`
	Username    string `json:"username"`
	Email       string `json:"email"`
	Password    string `json:"password"`
	Email_Token string `json:"emailToken"`
	Active      int    `json:"isActive"`
	Avatar      string `json:"avatar"`
	Role        int    `json:"role"`
	Address     string `json:"address"`
	Phone       string `json:"phone"`
	Created_At  string `json:"createdAt"`
}

var (
	Db    *sql.DB
	Store = sessions.NewCookieStore([]byte("super-secret-key"))
)

func main() {
	var err error
	godotenv.Load(".env")
	dbUrl := os.Getenv("DATABASE_URL")
	fmt.Println(dbUrl)
	// Db, err = sql.Open("mysql", "root:Nhuqy+#-1@tcp(127.0.0.1:3306)/bookstore")
	Db, err = sql.Open("mysql", dbUrl)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer Db.Close()
	fmt.Println("Connect Sucessful!!!")

	if _, err := os.Stat("images"); os.IsNotExist(err) {
		os.Mkdir("images", 0755)
	}
	r := gin.Default()
	r.LoadHTMLGlob("templates/*.html")

	r.Static("/images", "./images")

	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"http://localhost:5173", "https://jewelry-shop-6gb2.vercel.app"} // Thay thế bằng origin của ứng dụng ReactJS của bạn
	r.Use(cors.New(config))

	r.POST("/insert", h.HandleInsert(Db))
	r.GET("/", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{"message": "Successfully"})
	})
	r.GET("/jewelry/all-products", h.GetAllProduct(Db))
	r.GET("/jewelry/:type", h.GetTypePro(Db))
	r.GET("/product/:id", h.GetProduct(Db))
	r.GET("/collection", h.GetAllCollection(Db))
	r.GET("/product-types", h.GetAllType(Db))
	r.GET("/collection/:col", h.GetCollection(Db))
	r.GET("/search", h.Search(Db))
	r.GET("/isEmailExist", h.IsEmailExist(Db))
	r.GET("/isUsernameExist", h.IsUsernameExist(Db))
	r.POST("/signup", h.SignUpAuth(Db, Store))
	r.GET("/verify-email/:id/:token", h.VerifyEmail(Db))
	r.GET("/send-email/:id", h.SendEmailHdl(Db))

	// err = r.Run("127.0.0.1:8080")
	// if err != nil {
	// 	fmt.Println(err.Error())
	// }

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Bắt đầu lắng nghe trên địa chỉ và cổng đã xác định
	err = http.ListenAndServe(":"+port, r)
	if err != nil {
		fmt.Println("Failed to start server:", err)
	}
}

func getInsertForm(c *gin.Context) {
	c.HTML(http.StatusOK, "insert.html", gin.H{})
}

func getUser(ctx *gin.Context) {
	var u User
	var lu []User
	stmt := "select * from user"
	rows, err := Db.Query(stmt)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	defer rows.Close()

	for rows.Next() {
		var avatar, address, phone sql.NullString
		fmt.Println("Avatar: ", avatar)
		err := rows.Scan(&u.Id, &u.Username, &u.Email, &u.Password, &u.Email_Token, &u.Active, &avatar, &u.Role, &address, &phone, &u.Created_At)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		if avatar.Valid {
			u.Avatar = avatar.String
		} else {
			u.Avatar = "" // Hoặc giá trị mặc định bạn muốn sử dụng cho Avatar khi NULL
		}

		if address.Valid {
			u.Address = address.String
		} else {
			u.Address = "" // Hoặc giá trị mặc định bạn muốn sử dụng cho Avatar khi NULL
		}

		if phone.Valid {
			u.Phone = phone.String
		} else {
			u.Phone = "" // Hoặc giá trị mặc định bạn muốn sử dụng cho Avatar khi NULL
		}

		lu = append(lu, u)
	}

	ctx.JSON(http.StatusOK, lu)
}
