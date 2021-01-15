class SharedPhoto extends React.Component {
	constructor(props) {
		super(props)
	}

	render() {
		return (
			<div className="items">
				{
					this.props.photos.map(photo => {
						return <Photo photo={photo} />
					})
				}
			</div>
		);
	}
}

function Photo(props) {
	let nameFileAfterUpload = props.photo.content.substring (props.photo.content.indexOf("/"),props.photo.content.length);               
    let srcImage = 'FileMessage/' + nameFileAfterUpload;
	return (
		<div class="item">
			<a href={srcImage} class="photo-shared">
				<img src={srcImage} alt="" />
			</a>
		</div>
	);
}