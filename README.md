# Cloud School Assignment

이 프로젝트는 사용자 관리 API로, 사용자 정보를 CRUD(생성, 읽기, 수정, 삭제)하는 기능을 제공합니다. 이 API는 Spring Boot로 구현되어 있으며, 데이터베이스는 MySQL을 사용하고 있습니다.

## 기술 스택
### 백엔드
- Spring Boot: 백엔드 서버 구현
- MySQL: 데이터베이스
- JPA/Hibernate: ORM
### 프론트엔드
- React: 프론트엔드 구현
- Axios: API 호출
  
![image](https://github.com/user-attachments/assets/9082c32c-7aab-4fe1-9b81-6651fdbe1bd8)

### 인프라
- AWS ECS: 서버 배포
- AWS RDS: Mysql로 데이터 저장
- AWS S3: 정적 웹 호스팅
  
![image](https://github.com/user-attachments/assets/368ec893-af1a-4de9-b5e4-0ad2b2874ad0)

## CI/CD 파이프라인 흐름
![image](https://github.com/user-attachments/assets/5851ca29-089e-4147-a283-049277a1b7a3)


## 기능 명세서

### 1. **사용자 목록 조회**: 모든 사용자 정보를 가져옵니다.

- **URL**: `/api/users`
- **Method**: `GET`
- **설명**: 모든 사용자의 정보를 반환합니다.

#### 예시 요청

```bash
GET /api/users
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com",
    "createdAt": "2024-01-01T12:00:00"
  },
  {
    "id": 2,
    "name": "Jane Doe",
    "email": "jane.doe@example.com",
    "createdAt": "2024-01-02T12:00:00"
  }
]
```
### 2. **사용자 정보 조회**: 특정 사용자의 정보를 조회합니다.
- URL: /api/users/{id}
- Method: GET
- 설명: 특정 사용자의 정보를 조회합니다.
- 매개변수:
  - id: 사용자의 고유 ID
#### 예시요청
```bash
GET /api/1
{
  "id": 1,
  "name": "John Doe",
  "email": "john.doe@example.com",
  "createdAt": "2024-01-01T12:00:00"
}
```
### 3. **사용자 생성**: 새로운 사용자 정보를 생성합니다.
- URL: /api/users
- Method: POST
- 설명: 새 사용자를 생성합니다.
- Body (JSON 형식):
  - name: 사용자 이름
  - email: 사용자 이메일
#### 예시요청
```bash
POST /api/users
Content-Type: application/json

{
  "name": "Alice Smith",
  "email": "alice.smith@example.com"
}
```
#### 예시 응답
```bash
{
  "id": 3,
  "name": "Alice Smith",
  "email": "alice.smith@example.com",
  "createdAt": "2024-11-29T12:00:00"
}
```
### 4. **사용자 수정**: 기존 사용자의 정보를 수정합니다.
- URL: /api/users/{id}
- Method: PUT
- 설명: 특정 사용자의 정보를 수정합니다.
- 매개변수:
  - id: 사용자의 고유 ID
  - Body (JSON 형식):
  - name: 수정할 사용자 이름
  - email: 수정할 사용자 이메일
#### 예시요청
```bash
PUT /api/users/1
Content-Type: application/json

{
  "name": "Johnathan Doe",
  "email": "johnathan.doe@example.com"
}
```
#### 예시 응답
```bash
{
  "id": 1,
  "name": "Johnathan Doe",
  "email": "johnathan.doe@example.com",
  "createdAt": "2024-01-01T12:00:00"
}
```
### 5. **사용자 삭제**: 특정 사용자를 삭제합니다.
- URL: /api/users/{id}
- Method: DELETE
- 설명: 특정 사용자를 삭제합니다.
- 매개변수:
  - id: 사용자의 고유 ID

#### 예시요청
```bash
DELETE /api/users/1
{
  "message": "User with ID 1 has been deleted."
}
```

## AS IS - TO BE
- 데이터베이스 자격증명 현재는 env 파일에 저장되어 있는데 secrets manager로 옮겨서 더욱 안전하게 저장
- ECS를 프라이빗 서브넷으로 옮겨 NAT GATEWAY와 연결하여 더욱 안전성을 높임
- RDS도 프라이빗 서브넷으로 옮겨 보안 향상
- 클라이언트에 회원 추가, 수정, 삭제 기능 추가