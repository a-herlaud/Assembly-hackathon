import asyncio
from mcp import ClientSession
from mcp.client.streamable_http import streamablehttp_client


async def main():
    async with streamablehttp_client(
        "https://mcp.code4code.eu/mcp"
    ) as (read, write, _):

        async with ClientSession(read, write) as session:
            await session.initialize()

            tools = await session.list_tools()

            for tool in tools.tools:
                print(tool.name)
                print(tool.description)
                print(tool.inputSchema)
                print("-" * 40)


asyncio.run(main())