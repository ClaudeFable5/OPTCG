-- AUTO-GENERATED: OP10-093 / 호밍 성
-- rules_id=OP10-093 script_id=880001308 fingerprint=d1857fff0166c14e3b887964ce5297fbe5074c4faf62aefe7eb00ca2b29df078
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              filter={
                color=[[BLACK]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 다음 상대의 턴 종료 시까지, 자신의 흑색 캐릭터 1장까지의 코스트 +3.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-093]],
    schema_version=1,
  })
end
