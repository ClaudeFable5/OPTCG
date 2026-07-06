-- AUTO-GENERATED: OP10-021 / 펑크 하자드
-- rules_id=OP10-021 script_id=880001236 fingerprint=76a3795099f27f0003397e1b1237ba7c19a00fab48f1ed31a659337cb51817b3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={
          {
            name=[[시저 클라운]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트할 수 있다: 자신의 리더가 「시저 클라운」인 경우, 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-021]],
    schema_version=1,
  })
end
