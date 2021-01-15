class SharedFile extends React.Component {
	constructor(props) {
		super(props)
	}

	render() {
		return (
			<div className="items">
				{
					this.props.files.map(file => {
						return <File file={file} />
					})
				}
			</div>
		);
	}
}

function File(props) {
	let nameFileBeforeUpload = props.file.content.substring (0,props.file.content.indexOf("/"));
	let nameFileAfterUpload = props.file.content.substring (props.file.content.indexOf("/"),props.file.content.length);
	let srcFile = 'FileMessage/' + nameFileAfterUpload;
	return (
		<div class="item">
			<a href={srcFile} download={nameFileBeforeUpload}>{nameFileBeforeUpload}</a>
		</div>
	);
}