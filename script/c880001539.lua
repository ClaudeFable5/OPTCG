-- AUTO-GENERATED: OP12-086 / 코알라
-- rules_id=OP12-086 script_id=880001539 fingerprint=13f7a955b83b7cbaa94aecef2d866f748d646bea6cb3773fcb273fcb470eafba
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name_neq=[[코알라]],
                  trait=[[혁명군]],
                },
                {
                  name=[[니코 로빈]],
                },
              },
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            rest_order=[[KEEP]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《혁명군》 특징을 가진 경우, 자신의 덱 위에서 3장을 보고, 「코알라」 이외의 《혁명군》 특징을 가진 카드 또는 「니코 로빈」을 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-086]],
    schema_version=1,
  })
end
