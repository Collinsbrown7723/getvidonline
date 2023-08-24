from flask import Flask, render_template,request,jsonify,redirect
from pytube import YouTube
app=Flask(__name__)

@app.route("/",methods=['GET'])

def index():
	return render_template("index.html")

@app.route('/download',methods=['POST'])
def download():
	video_url = request.form['video_url']
	try:
		# Create a YouTube object
		yt = YouTube(video_url)
		stream = yt.streams.get_highest_resolution()
		stream.download()
		return jsonify({'status':'succes','message':'video downloaded successfully.'})
	except Exception as e:
		return jsonify({'status':'error','message':str(e)})

if __name__ == "__main__":
	app.run(debug = True)
	

	#download_video(link, download_path, resolution, file_format)