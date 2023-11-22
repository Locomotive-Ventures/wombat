import { createClient } from '@/utils/supabase/server'
import Link from 'next/link'
import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'

export default async function AuthButton() {
  const cookieStore = cookies()
  const supabase = createClient(cookieStore)

  const {
    data: { user },
  } = await supabase.auth.getUser()

  const signOut = async () => {
    'use server'

    const cookieStore = cookies()
    const supabase = createClient(cookieStore)
    await supabase.auth.signOut()
    return redirect('/login')
  }

  return user ? (
    <div className="flex items-center gap-4 flex"
    style={{ 
      color: 'white',
      background: 'black',
      textAlign: 'right',
      fontWeight: 'bold',
    }}
    >
      <form action={signOut}>
        <button className="py-10 px-4  no-underline text-background bg-foreground  transition-colors hover:bg-white hover:text-black flex"
        style={{ 
          color: 'white',
          background: '#047857',
          textAlign: 'right',
          fontSize: '1rem', 
          fontWeight: 'bold',
        }}
        >
          Logout
        </button>
      </form>
    </div>
  ) : (
    <div className='flex'>
      <Link
        href="/login"
        className="no-underline  py-10 px-20 text-background bg-foreground  transition-colors hover:bg-white hover:text-white"
        style={{ 
          color: 'black',
          background: '#047857',
          textAlign: 'right',
          fontSize: '1rem', 
          fontWeight: 'bold',
        }}
        >
        Login
      </Link>
    </div>
  )
}
