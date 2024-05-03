from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes
import asyncio
# Hello world


#Testtorch .env

async def get_output(command: str) -> str:
    print("in get output")
    process = await asyncio.create_subprocess_shell(command, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE)
    output, error = await process.communicate()
    if error:
        return str(error)
    return str(output)

async def hello(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(f'Hello {update.effective_user.first_name}')

async def uptime(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    print("in uptime")
    output = await get_output("uptime")
    uptime_data = output.split(",")  # Split the output by comma

    up_time = uptime_data[0].split("up ")[1]  # Get the uptime
    users = uptime_data[1].split("user")[0].strip()  # Get the number of users
    load_avg = ", ".join(uptime_data[2:])
    pretty_output = f"Uptime: ⏱ {up_time}\nUsers: {users}\nLoad Average: {load_avg}"
    await context.bot.send_message(chat_id=update.effective_chat.id, text=pretty_output)

async def wifi(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    print("wifi")
    output = await get_output("iwconfig wlan0 | grep Signal")
    await context.bot.send_message(chat_id=update.effective_chat.id, text=f"📶 {output}")

async def hot(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    print("hot")
    output = await get_output("vcgencmd measure_temp")
    await context.bot.send_message(chat_id=update.effective_chat.id, text=f"🧯 {output}")


app = ApplicationBuilder().token("").build()

app.add_handler(CommandHandler("hello", hello))
app.add_handler(CommandHandler("uptime", uptime))
app.add_handler(CommandHandler("wifi", wifi))

app.run_polling()