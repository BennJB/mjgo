# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create( [{ item: "서적" }, { item: "기타" }] )
Selling.create( [{title: "판매중"}, {title: "예약중"}, {title: "판매완료"}] )
Mozip.create( [{title: "모집중"}, {title: "모집 마감"}] )
Mozipp.create( [{title: "모집중"}, {title: "마감"}] )
Moimcategory.create ( [{title: "친목"}, {title: "예체능"}, {title: "IT"}, {title: "스터디"}] )

Cookchoice.create ( [{title: "혼자먹기 좋은 곳"}, {title: "양 많은 곳"}, {title: "분위기 좋은 곳"}, {title: "공부하기 좋은 곳"}, {title: "기타"}] )
Cooklist.create ( [{title: "한식"}, {title: "양식/고기"}, {title: "일식/중식"}, {title: "분식/치킨"}, {title: "카페"}] )