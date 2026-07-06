-- AUTO-GENERATED: OP12-072 / 제프
-- rules_id=OP12-072 script_id=880001525 fingerprint=b1027c313d13cf652b12ba2c2a73ebaedaab252fcdc200ea971e931f62c0d453
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[상디]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 자신의 리더가 「상디」인 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-072]],
    schema_version=1,
  })
end
