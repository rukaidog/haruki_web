	//α����  
	var BLOCK_SIZE = 20; //���Ӵ�С  
	var COLS = 40; //����  
	var ROWS = 30; //����  
	//����  
	var snakes = []; //����������  
	var c = null; //��ͼ����  
	var toGo = 3; //�н�����  
	var snakecount = 4; //��������  
	var interval = null; //��ʱ��  
	var foodX = 0; //ʳ��X������  
	var foodY = 0; //ʳ��Y������  
	var score = null; //������ʾ��  
	var isPause = false; //�Ƿ���ͣ  
	// ��ͼ����  
	function draw() {
		c.clearRect(0, 0, BLOCK_SIZE * COLS, BLOCK_SIZE * ROWS);
		//��������  
		for (var i = 1; i <= ROWS; i++) {
			c.beginPath();
			c.moveTo(0, i * BLOCK_SIZE);
			c.lineTo(BLOCK_SIZE * COLS, i * BLOCK_SIZE);
			c.strokeStyle = "gray";
			c.stroke();
		}
		//��������  
		for (var i = 1; i <= COLS; i++) {
			c.beginPath();
			c.moveTo(i * BLOCK_SIZE, 0);
			c.lineTo(i * BLOCK_SIZE, BLOCK_SIZE * ROWS);
			c.stroke();
		}
		//������  
		for (var i = 0; i < snakes.length; i++) {
			c.beginPath();
			c.fillStyle = "green";
			c.fillRect(snakes[i].x, snakes[i].y, BLOCK_SIZE, BLOCK_SIZE);
			c.moveTo(snakes[i].x, snakes[i].y);
			c.lineTo(snakes[i].x + BLOCK_SIZE, snakes[i].y);
			c.lineTo(snakes[i].x + BLOCK_SIZE, snakes[i].y + BLOCK_SIZE);
			c.lineTo(snakes[i].x, snakes[i].y + BLOCK_SIZE);
			c.closePath();
			c.strokeStyle = "white";
			c.stroke();
		}
		//����ʳ��  
		c.beginPath();
		c.fillStyle = "yellow";
		c.fillRect(foodX, foodY, BLOCK_SIZE, BLOCK_SIZE);
		c.moveTo(foodX, foodY);
		c.lineTo(foodX + BLOCK_SIZE, foodY);
		c.lineTo(foodX + BLOCK_SIZE, foodY + BLOCK_SIZE);
		c.lineTo(foodX, foodY + BLOCK_SIZE);
		c.closePath();
		c.strokeStyle = "red";
		c.stroke();
	}
	//��Ϸ��ʼ��  
	function start() {
		for (var i = 0; i < snakecount; i++) {
			snakes[i] = {
				x : i * BLOCK_SIZE,
				y : 0
			};
		}
		addFood();
		draw();
		score.innerHTML = 0;
	}
	//�ƶ�����  
	function move() {
		switch (toGo) {
		case 1: //���  
			snakes.push({
				x : snakes[snakecount - 1].x - BLOCK_SIZE,
				y : snakes[snakecount - 1].y
			});
			break;
		case 2: //�ϱ�  
			snakes.push({
				x : snakes[snakecount - 1].x,
				y : snakes[snakecount - 1].y - BLOCK_SIZE
			});
			break;
		case 3: //�ұ�  
			snakes.push({
				x : snakes[snakecount - 1].x + BLOCK_SIZE,
				y : snakes[snakecount - 1].y
			});
			break;
		case 4: //�±�  
			snakes.push({
				x : snakes[snakecount - 1].x,
				y : snakes[snakecount - 1].y + BLOCK_SIZE
			});
			break;
		default:
			;
		}
		snakes.shift();
		isEat();
		isDie();

		draw();
	}
	//�Ե�ʳ���ж�  
	function isEat() {
		if (snakes[snakecount - 1].x == foodX
				&& snakes[snakecount - 1].y == foodY) {
			score.innerHTML = (parseInt(score.innerHTML) + 1).toString();
			addFood();
			addSnake();
		}
	}
	//�������  
	function addSnake() {
		snakecount++;
		snakes.unshift({
			x : BLOCK_SIZE * COLS,
			y : BLOCK_SIZE * ROWS
		});
	}
	//������Ӧ����  
	function keydown(keyCode) {
		switch (keyCode) {
		case 37: //���  
			if (toGo != 1 && toGo != 3)
				toGo = 1;
			break;
		case 38: //�ϱ�  
			if (toGo != 2 && toGo != 4)
				toGo = 2;
			break;
		case 39: //�ұ�  
			if (toGo != 3 && toGo != 1)
				toGo = 3;
			break;
		case 40: //�µ�  
			if (toGo != 4 && toGo != 2)
				toGo = 4;
			break;
		case 80: //��ʼ/��ͣ  
			if (isPause) {
				interval = setInterval(move, 100);
				isPause = false;
				document.getElementById('pause').innerHTML = "Pause";
			} else {
				clearInterval(interval);
				isPause = true;
				document.getElementById('pause').innerHTML = "Start";
			}
			break;
		}
	}
	//����ʳ��  
	function addFood() {
		foodX = Math.floor(Math.random() * (COLS - 1)) * BLOCK_SIZE;
		foodY = Math.floor(Math.random() * (ROWS - 1)) * BLOCK_SIZE;
		// console.log(foodX + " -- " + foodY);  
	}
	//�����ж�  
	function isDie() {
		//ײǽ
		if (snakes[snakecount - 1].x == -20
				|| snakes[snakecount - 1].x == BLOCK_SIZE * COLS
				|| snakes[snakecount - 1].y == -20
				|| snakes[snakecount - 1].y == BLOCK_SIZE * ROWS) {
			alert("Game Over!");
			clearInterval(interval);
			dbScore();

		}
		for (var i = 0; i < snakecount - 1; i++) { //ײ�Լ�
			if (snakes[snakecount - 1].x == snakes[i].x
					&& snakes[snakecount - 1].y == snakes[i].y) {
				clearInterval(interval);
				alert("Game Over!");
				dbScore();

			}
		}
	}
	//�����ѷ����������ݿ�
	function dbScore() {
		var scr = _('scoreVal').innerHTML;
		_v('score', scr);
		_('scoreFrm').submit();
	}

	function _(id) {
		return document.getElementById(id);
	}

	function _v(id, value) {
		return arguments.length === 2 ? (_(id).value = value) : _(id).value;
	}

	// ��������  
	window.onload = function() {
		c = document.getElementById('canvas').getContext('2d');
		score = document.getElementById('scoreVal');
		start();
		interval = setInterval(move, 100);
		document.onkeydown = function(event) {
			var event = event || window.event;
			keydown(event.keyCode);
		}
	}