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
      background: '#403D39',
      textAlign: 'right',
      fontWeight: 'bold',
    }}
    >
      <span
        style={{
          fontSize: '0.8vw', 
          whiteSpace: 'nowrap', 
          overflow: 'hidden', 
          textOverflow: 'ellipsis', 
        }}
      >
        {user.email}:
      </span>
      <form action={signOut}>
        <button 
        className="no-underline text-background bg-foreground transition-colors hover:bg-white hover:text-white"
        style={{
          width: '15vw',
          height: '10vw',
          color: 'white',
          background: '#252422',
          textAlign: 'center',
          fontSize: '1rem',
          fontWeight: 'bold',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          border: 'none', // Add this line to remove the button border
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
        className="no-underline text-background bg-foreground transition-colors hover:bg-white hover:text-white "
        style={{
          width: '15vw',
          color: 'white',
          background: '#252422',
          textAlign: 'center',
          fontSize: '1rem',
          fontWeight: 'bold',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
        }}
        >
        Login
      </Link>
    </div>
  )
}
