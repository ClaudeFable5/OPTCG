-- AUTO-GENERATED: OP08-079 / 카이도
-- rules_id=OP08-079 script_id=880001055 fingerprint=9cc0962dbbf26d5abe4b02714d166d1df1a0b93d740caac7b89e3878cdc3ee97
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[TRASH]],
            selector={
              count=1,
              filter={
                cost_lte=7,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[SELF_PLAYED_THIS_TURN]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패 1장을 버릴 수 있다: 이 캐릭터가 등장한 턴인 경우, 상대의 코스트 7 이하인 캐릭터를 1장까지 트래시로 보낸다. 그 후, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-079]],
    schema_version=1,
  })
end
