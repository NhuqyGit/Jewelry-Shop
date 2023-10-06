package user

type User struct {
	Id          string `json:"id"`
	Username    string `json:"username"`
	Email       string `json:"email"`
	Password    string `json:"password"`
	Email_Token string `json:"email_token"`
	Active      bool   `json:"isActive"`
	Avatar      string `json:"avatar"`
	Role        bool   `json:"role"`
	Address     string `json:"address"`
	Phone       string `json:"phone"`
	Created_At  string `json:"createAt"`
}
