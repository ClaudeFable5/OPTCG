-- AUTO-GENERATED: OP13-025 / 코비
-- rules_id=OP13-025 script_id=880001597 fingerprint=ca056c0d2983b6a5885c22c24f6b927683e5f69448f706d4238bdf1660a316b9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            filter={
              any={
                {
                  trait=[[FILM]],
                },
                {
                  attribute=[[STRIKE]],
                },
              },
            },
            leader_only=true,
            op=[[LEADER_OR_CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《FILM》 특징 또는 <타격> 속성을 가진 경우, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-025]],
    schema_version=1,
  })
end
