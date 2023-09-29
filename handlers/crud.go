package handlers

import (
	"database/sql"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"

	col "JewelryShop/model/collection"
	j "JewelryShop/model/jewelry"
	tp "JewelryShop/model/jewtype"
	"encoding/json"
	"fmt"

	// "io/ioutil"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/google/uuid"
)

func HandleInsert(db *sql.DB) gin.HandlerFunc {
	return func(c *gin.Context) {
		var jew j.InJew
		jewData := c.PostForm("jewelryData")
		if err := json.Unmarshal([]byte(jewData), &jew); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		fmt.Println(jew)

		// for _, file := range files {
		// 	destinationPath := "images/" + file.Filename

		// 	// Lưu tệp ảnh vào máy chủ
		// 	if err := c.SaveUploadedFile(file, destinationPath); err != nil {
		// 		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		// 		return
		// 	} else {
		// 		fmt.Println("INSERT JEWELRY SUCCESS!!!")
		// 	}
		// }

		var err error
		var imageId string
		// var jewType, jewCol, jewPrice int

		// Jewelry
		jew.Id = uuid.NewString()
		jewPrice, _price := strconv.Atoi(jew.Price)
		jewType, _type := strconv.Atoi(jew.IdType)
		jewCol, _col := strconv.Atoi(jew.IdCol)
		if _price != nil || _type != nil || _col != nil {
			fmt.Println(err.Error())
		}

		// Jew Detail

		//ImageJewelry

		// query
		// Insert Jew
		stmt := "insert into jewelry values(?, ?, ?, ?, ?, ?)"
		_, err = db.Exec(stmt, jew.Id, jewCol, jewType, jew.JewelryName, jewPrice, jew.Des)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"errJew": err.Error()})
			return
		} else {
			fmt.Println("INSERT JEWELRY SUCCESS!!!")
		}

		// Insert Jew Detail
		jType := []string{"ring", "glasses", "necklace", "bracelet", "earrings"}
		tmp, _ := strconv.Atoi(jew.IdType)
		table := jType[tmp-1]
		fmt.Println(table)

		//Ring and Earring
		if jew.IdType == "1" || jew.IdType == "5" {
			stmt = "insert into " + table + " values(?, ?, ?, ?, ?)"
			for key, value := range jew.Sizes {
				IdJewDetail := uuid.NewString()
				if value == "" {
					continue
				}
				_value, _ := strconv.Atoi(value)
				_, err = db.Exec(stmt, IdJewDetail, jew.Id, key[4:], jew.Material, _value)
				if err != nil {
					c.JSON(http.StatusInternalServerError, gin.H{"errRing": err.Error()})
					return
				} else {
					fmt.Println("INSERT JEW DETAILS SUCCESS!!!")
				}
			}

			//Other jew
		} else {
			jewQuantity, _quantity := strconv.Atoi(jew.Quantity)
			IdJewDetail := uuid.NewString()
			if _quantity != nil {
				fmt.Println(err.Error())
			}
			stmt = "insert into " + table + " values(?, ?, ?, ?)"
			_, err = db.Exec(stmt, IdJewDetail, jew.Id, jew.Material, jewQuantity)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"errRing": err.Error()})
				return
			} else {
				fmt.Println("INSERT JEW DETAILS SUCCESS!!!")
			}
		}

		// Insert Images
		form, _ := c.MultipartForm()
		files := form.File["images"]
		stmt = "insert into jewelryimage values(?, ?, ?)"
		for _, image := range files {
			ext := strings.ToLower(filepath.Ext(image.Filename))
			if ext != ".jpg" && ext != ".png" {
				c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid file format"})
				return
			}

			filename := "images/" + image.Filename

			if err := c.SaveUploadedFile(image, filename); err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}

			imageId = uuid.NewString()
			_, err = db.Exec(stmt, imageId, jew.Id, filename)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"errRing": err.Error()})
				return
			} else {
				fmt.Println("INSERT IMAGE SUCCESS!!!")
			}
		}

		c.JSON(http.StatusOK, gin.H{"message": "Insert successfully"})
	}
}

func GetAllProduct(db *sql.DB) gin.HandlerFunc {
	return func(c *gin.Context) {
		var allJew []j.Jewelry
		getJew := `SELECT j.IdJewelry, j.jewname, j.jewprice, i.pathimage
		FROM Jewelry j
		LEFT JOIN JewelryImage i ON j.IdJewelry = i.IdJewelry and i.pathimage like "%400x400%"`

		rows, err := db.Query(getJew)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"getError": err.Error()})
		}
		defer rows.Close()

		for rows.Next() {
			var jew j.Jewelry
			var imageStr string
			rows.Scan(&jew.Id, &jew.JewelryName, &jew.Price, &imageStr)

			jew.Images = append(jew.Images, imageStr)
			allJew = append(allJew, jew)
		}

		c.JSON(http.StatusOK, allJew)
	}
}

func GetProduct(db *sql.DB) gin.HandlerFunc {
	return func(c *gin.Context) {
		var jew j.Jewelry
		var images string
		id := c.Param("id")
		stmt := `select j.IdJewelry, TypeName, JewName, JewPrice, JewDes, GROUP_CONCAT(ji.PathImage) AS Images
				from jewelry j 
				left join jewelrytype jt on jt.IdType = j.IdType 
				left join jewelryimage ji on ji.IdJewelry = j.IdJewelry
				where j.IdJewelry = ?
				group by j.IdJewelry, TypeName, JewName, JewPrice, JewDes`

		jewData, err := db.Query(stmt, id)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"errorJewData": err.Error()})
			return
		}
		defer jewData.Close()

		if jewData.Next() {
			err := jewData.Scan(&jew.Id, &jew.TypeName, &jew.JewelryName, &jew.Price, &jew.Des, &images)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"errorJewDataRow": err.Error()})
				return
			}
		}

		if jew.TypeName == "Ring" || jew.TypeName == "Earrings" {
			jew.Sizes = make(map[string]int)
			stmt = "select size, material, quantity from " + jew.TypeName + " where IdJewelry = ?"
			jewDetail, err := db.Query(stmt, id)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"errorJewDetail": err.Error()})
				return
			}
			defer jewDetail.Close()

			for jewDetail.Next() {
				var size string
				var quantity int
				err := jewDetail.Scan(&size, &jew.Material, &quantity)
				if err != nil {
					c.JSON(http.StatusInternalServerError, gin.H{"errorJewDetailRows": err.Error()})
					return
				}
				jew.Sizes[size] = quantity
			}
		} else {
			fmt.Println(jew)
			stmt = "select material, quantity from " + jew.TypeName + " where IdJewelry = ?"
			jewDetail, err := db.Query(stmt, id)
			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"errorAAA": err.Error()})
				return
			}
			defer jewDetail.Close()

			if jewDetail.Next() {
				err := jewDetail.Scan(&jew.Material, &jew.Quantity)
				if err != nil {
					c.JSON(http.StatusInternalServerError, gin.H{"errorBBBB": err.Error()})
					return
				}
			}
		}

		// split images
		listImage := strings.Split(images, ",")
		for _, image := range listImage {
			jew.Images = append(jew.Images, image)
		}

		c.JSON(http.StatusOK, jew)

	}
}

func GetAllCollection(db *sql.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var listCol []col.Collection
		stmt := "select * from collections"
		rows, err := db.Query(stmt)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		defer rows.Close()
		for rows.Next() {
			var col col.Collection
			err = rows.Scan(&col.IdColl, &col.CollName, &col.CollImage)
			if err != nil {
				ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}
			listCol = append(listCol, col)
		}

		ctx.JSON(http.StatusOK, listCol)
	}
}

func GetAllType(db *sql.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var listJewType []tp.JewType
		stmt := "select * from jewelrytype"
		rows, err := db.Query(stmt)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}
		defer rows.Close()

		for rows.Next() {
			var jewType tp.JewType
			rows.Scan(&jewType.IdType, &jewType.TypeName, &jewType.TypeImage)

			listJewType = append(listJewType, jewType)
		}

		ctx.JSON(http.StatusOK, listJewType)
	}
}

func GetCollection(db *sql.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var listJew []j.Jewelry
		col := ctx.Param("col")

		stmt := `select j.IdJewelry, j.jewname, j.jewprice, i.pathimage
		from jewelry j
		LEFT JOIN JewelryImage i ON j.IdJewelry = i.IdJewelry and i.pathimage like "%400x400%"
		where j.IdColl = ?`

		rows, err := db.Query(stmt, col)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer rows.Close()

		for rows.Next() {
			var jew j.Jewelry
			var imageStr string
			err = rows.Scan(&jew.Id, &jew.JewelryName, &jew.Price, &imageStr)
			if err != nil {
				ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}
			jew.Images = append(jew.Images, imageStr)
			listJew = append(listJew, jew)
		}

		ctx.JSON(http.StatusOK, listJew)
	}
}

func GetTypePro(db *sql.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var listJew []j.Jewelry
		_type := ctx.Param("type")

		stmt := `select j.IdJewelry, j.jewname, j.jewprice, i.pathimage
		from jewelry j
		LEFT JOIN JewelryImage i ON j.IdJewelry = i.IdJewelry and i.pathimage like "%400x400%"
        LEFT JOIN JewelryType jt ON jt.IdType = j.IdType
		where jt.TypeName = ?`

		rows, err := db.Query(stmt, _type)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer rows.Close()

		for rows.Next() {
			var jew j.Jewelry
			var imageStr string
			err = rows.Scan(&jew.Id, &jew.JewelryName, &jew.Price, &imageStr)
			if err != nil {
				ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}
			jew.Images = append(jew.Images, imageStr)
			listJew = append(listJew, jew)
		}

		ctx.JSON(http.StatusOK, listJew)
	}
}

func Search(db *sql.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var listJew []j.Jewelry
		key := ctx.Query("keyword")
		value := "%" + key + "%"
		fmt.Println(key)
		stmt := `select j.IdJewelry, j.jewname, j.jewprice, i.pathimage
		from jewelry j
		LEFT JOIN JewelryImage i ON j.IdJewelry = i.IdJewelry and i.pathimage like "%400x400%"
		where j.JewName like ?`

		rows, err := db.Query(stmt, value)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error12": err.Error()})
			return
		}
		defer rows.Close()

		for rows.Next() {
			var jew j.Jewelry
			var imageStr string
			err = rows.Scan(&jew.Id, &jew.JewelryName, &jew.Price, &imageStr)
			if err != nil {
				ctx.JSON(http.StatusInternalServerError, gin.H{"error3": err.Error()})
				return
			}
			jew.Images = append(jew.Images, imageStr)
			listJew = append(listJew, jew)
		}
		ctx.JSON(http.StatusOK, listJew)
	}
}
