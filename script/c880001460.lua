-- AUTO-GENERATED: OP12-007 / 샹크스
-- rules_id=OP12-007 script_id=880001460 fingerprint=bcec6d696cc10255207682d1b5fdade99a6560daa38f266fe857662111628820
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-007]],
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
              filter={
                name_neq=[[샹크스]],
                trait_contains=[[로저 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 「샹크스」 이외의 『로저 해적단』을 포함한 특징을 가진 캐릭터 1장까지는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-007]],
    schema_version=1,
  })
end
