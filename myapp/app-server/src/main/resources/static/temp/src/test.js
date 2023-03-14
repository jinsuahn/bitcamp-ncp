"use strict";
console.log("started!");

// 좋아요 버튼 리액트 컴포넌트 정의
class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      liked: false,
    };
  }

  // 부모 컴포넌트에서 순차적으로 내려오면서 호출된다.
  // 하는 일은 HTML 태그를 생성하는 일을 한다.
  // 또는 하위 컴포넌트를 생성하는 일을 한다.
  render() {
    if (this.state.liked) {
      return "Like you!";
    }

    return (
      <button
        onClick={() => {
          this.setState({ liked: true });
        }}
      >
        LIKE!
      </button>
    );
  }
}

document.querySelectorAll(".like-container").forEach((likeContainer) => {
  const root = ReactDOM.createRoot(likeContainer);
  root.render(React.createElement(LikeButton));
});
console.log("complited!");
